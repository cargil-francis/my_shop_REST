from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.views import TokenObtainPairView
from .serializer import  (RegisterSerializer, CategorySerializer
,ProductSerializer,ContactSerializer,ProductupdateSerializer,
productdetailSerializer,UserContactSerializer,DiscountSerializer,
OfferSerializer,CartSerializer,
AddressSerializer, OrderSerializer)
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.permissions import IsAdminUser,IsAuthenticated
from shop.models import Category ,Product,Address,Offer,Cart, Order
from rest_framework .generics import DestroyAPIView,RetrieveUpdateDestroyAPIView,ListAPIView,CreateAPIView
from rest_framework import filters
from django.shortcuts import get_object_or_404
from django.core.mail import send_mail
from django.conf import settings





class ObtainTokenPairWithCookieView(TokenObtainPairView):
    def post(self, request, *args, **kwargs):
        response = super().post(request, *args, **kwargs)
        token = response.data['access']
        print(token)
        #request.session['identity']=token.identity
        response.set_cookie('jwt', token, max_age=3600, httponly=True)
        return response

class TokenBlacklistView(APIView):
    def post(self, request):
        token = RefreshToken(request.data.get('refresh'))
        token.blacklist()
        return Response("Success")


#Registeration
class RegisterAPIView(generics.GenericAPIView):
    serializer_class = RegisterSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()

        response_data = {
            "message": "User created successfully",
            "user": {
                "id": user.id,
                "username": user.username,
                
                "email": user.email
            }
        }
        return Response(response_data)

#category
class AddCategoryAPIView(generics.CreateAPIView):
    permission_classes= [IsAuthenticated,IsAdminUser]
    serializer_class =  CategorySerializer

class CategoryAPIView(generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    permission_classes = [IsAuthenticated]
  
#product

class AddProductAPIView(generics.CreateAPIView):
    permission_classes= [IsAuthenticated,IsAdminUser]
    serializer_class = ProductSerializer

class ProductAPIView(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    filter_backends = [filters.SearchFilter]
    filterset_fields = ['category']
    search_fields = ['title', 'price']

    def get_queryset(self):
        queryset = super().get_queryset()
        price_min = self.request.query_params.get('price_min', None)
        price_max = self.request.query_params.get('price_max', None)
        if price_min is not None and price_max is not None:
            queryset = queryset.filter(price__range=(price_min,price_max))
        return queryset
    



class CreatediscountAPIVIEW(generics.CreateAPIView):
    permission_classes = [IsAuthenticated,IsAdminUser]
    
    serializer_class = DiscountSerializer


#CreateofferAPIVIEW
class CreateofferAPIVIEW(generics.CreateAPIView):
    permission_classes = [IsAuthenticated,IsAdminUser]
   
    serializer_class = OfferSerializer




#product offer
class OfferProductAPIVIEW(generics.ListAPIView):
    queryset = Offer.objects.all()
    serializer_class = OfferSerializer
    permission_classes = [IsAuthenticated]





#product detail api
class ProductDetailAPIView(generics.ListAPIView):
     queryset = Product.objects.all()
     permission_classes = [IsAuthenticated]
     serializer_class = productdetailSerializer
     lookup_field = 'id'

#user contact
class UsercontactAPIView(generics.CreateAPIView):
    serializer_class = ContactSerializer
    permission_classes = [IsAuthenticated]
    def perform_create(self, serializer):
        serializer.save(user=self.request.user)
        return Response(serializer.data)


class ViewUsercontactAPIVIEW(generics.ListAPIView):
    serializer_class = UserContactSerializer
    permission_classes = [IsAuthenticated]

    def get(self, request):
        user = request.user
        serializer = self.get_serializer(user)
        queryset = Address.objects.filter(user=user)
        print(queryset)
        data = {
            'user' : serializer.data,                      
        }

        return Response(data)
    
    

# Logout

# class LogoutView(APIView):
#     def post(self, request, *args, **kwargs):
#         response = JsonResponse({'message': 'Successfully logged out'}, status=200)
#         response.delete_cookie('jwt')
#         return response
  
  
   




#Admin
class admincontactAPIView(generics.CreateAPIView):
    serializer_class = ContactSerializer
    permission_classes = [IsAdminUser,IsAuthenticated]
    def perform_create(self, serializer):
        serializer.save(user=self.request.user)
        return Response(serializer.data)


   
class contactAPIVIEW(generics.ListAPIView):
    queryset = Address.objects.all()
    serializer_class = ContactSerializer
    permission_classes = [IsAuthenticated]

class updateProductAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductupdateSerializer
    lookup_field = 'id'
    permission_classes = [IsAdminUser,IsAuthenticated]

#Delete Product
class ProductDeleteview(DestroyAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    lookup_field = 'id'
    permission_classes = [IsAdminUser]

    def delete(self, request, *args, **kwargs):
        response = JsonResponse({'message': 'User Deleted Sucessfully'}, status=200)
        return response



class TokenBlacklistView(APIView):
    def post(self, request):
        token = RefreshToken(request.data.get('refresh'))
        token.blacklist()
        return Response("Success")




#cart
class AddToCartView(CreateAPIView):
    serializer_class = CartSerializer
    permission_classes = [IsAuthenticated]



#checkout

# class CheckoutAPIView(generics.CreateAPIView):
#     serializer_class = CheckoutSerializer



class CartCheckoutView(generics.CreateAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = OrderSerializer

    def post(self, request, *args, **kwargs):
        cart_items = Cart.objects.filter(user=request.user)
        if cart_items:
            for cart_item in cart_items:
                print(cart_item.quantity)
            total_cost = sum(item.product.price * item.quantity for item in cart_items)
            print(total_cost)

            if 'address' in request.data:
                address_data = request.data['address']
                print(address_data)
                address = Address.objects.create(
                    user=request.user,
                    locality=address_data['locality'],
                    city=address_data['city'],
                    state=address_data['state'],
                    phone=address_data['phone']
                )
            else:
                address = Address.objects.filter(user=request.user).last()
                print(address, "Address")

            # order = Order.objects.create(user=request.user, address=address)

            for item in cart_items:
                print(item.quantity, "quantity thaazhe")
                order = Order.objects.create(product=item.product, quantity=item.quantity, address=address, user= request.user)

            cart_items.delete()

            send_mail(
                'Order Confirmaton',
                'It is to inform that your order ahs been placed.',
                'from@example.com',
                ['kitty.f9876@gmail.com'],
                fail_silently=False,
            )

            serializer = OrderSerializer(order)
            return Response(serializer.data)
        else:
            return Response("Your cart is empty. Please add some products to checkout")
