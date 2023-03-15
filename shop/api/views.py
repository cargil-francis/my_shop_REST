from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.views import TokenObtainPairView
from .serializer import  RegisterSerializer, CategorySerializer,ProductSerializer,ContactSerializer,ProductupdateSerializer,productdetailSerializer,UserContactSerializer,DiscountSerializer,OfferSerializer,CartSerializer
from rest_framework import generics,status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.permissions import IsAdminUser,IsAuthenticated
from shop.models import Category ,Product,Address,Offer,Cart
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

# class AddToCart(APIView):
#     def post(self, request, product_id):
#         # Check if the product exists
#         product = get_object_or_404(Product, id=product_id)

#         # Get the cart or create a new one if it doesn't exist
#         cart, created = Cart.objects.get_or_create(user=request.user)

#         # Check if the product is already in the cart
#         if cart.products.filter(id=product.id).exists():
#             return Response({"error": "Product is already in the cart"}, status=status.HTTP_400_BAD_REQUEST)

#         # Add the product to the cart
#         # cart.products.add(product)
#         cart.add_product(product)

#         # Serialize the cart and return it
#         serializer = CartSerializer(cart)
#         return Response(serializer.data, status=status.HTTP_201_CREATED)




# class AddToCart(APIView):
#     permission_classes = [IsAuthenticated]
#     serializer_class = CartSerializer

#     def post(self, request, id):
#         product = Product.objects.get(pk=id)
#         # cart, created = Cart.objects.get_or_create(user=request.user)
#         serializer = CartSerializer(data=request.data)
#         if serializer.is_valid():
#             quantity = serializer.validated_data['quantity']
#             # Check if item is already in the cart
#             try:
#                 cart_item= Cart.objects.get(product=product)
#                 cart_item.quantity += quantity
#                 cart_item.save()
#             except Cart.DoesNotExist:
#                 # Add item to cart
#                 cart_item = Cart(product=product, quantity=quantity)
#                 cart_item.quantity = quantity
#                 cart_item.save()
            
#             # return Response(status=status.HTTP_201_CREATED)
#             return Response(serializer.data, status=status.HTTP_201_CREATED)
#         else:
#             return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



class AddToCartView(CreateAPIView):
    serializer_class = CartSerializer
    permission_classes = [IsAuthenticated]






# class Checkout(APIView):
#     def post(self, request):
#         # Get the user's cart
#         cart = get_object_or_404(Cart, user=request.user)
        
#         # Create an order from the cart
#         order = Order.objects.create(user=request.user, total_price=cart.total_price())
        
#         # Move items from the cart to the order
#         for item in cart.items.all():
#             order.items.create(product=item.product, quantity=item.quantity, price=item.price)
#             item.delete()
        
#         # Send email to user
#         subject = 'Order Confirmation'
#         message = f'Thank you for your order! Your order ID is {order.id}.'
#         from_email = settings.DEFAULT_FROM_EMAIL
#         to_email = request.user.email
#         send_mail(subject, message, from_email, [to_email], fail_silently=False)
        
#         # Serialize the order and send response
#         serializer = OrderSerializer(order)
#         return Response(serializer.data, status=status.HTTP_201_CREATED)