from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.views import TokenObtainPairView
from .serializer import  RegisterSerializer, CategorySerializer,ProductSerializer,ContactSerializer,ProductupdateSerializer
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.permissions import IsAdminUser,IsAuthenticated
from shop.models import Category ,Product,Address
from rest_framework .generics import DestroyAPIView,RetrieveUpdateDestroyAPIView,ListAPIView,CreateAPIView
from rest_framework import filters





class ObtainTokenPairWithCookieView(TokenObtainPairView):
    def post(self, request, *args, **kwargs):
        response = super().post(request, *args, **kwargs)
        token = response.data['access']
        print(token)
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
    #permission_classes= [IsAuthenticated,IsAdminUser]
    serializer_class = ProductSerializer

class ProductAPIView(generics.ListAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['title', 'price']
    products = Product.objects.all().order_by('price')
    #permission_classes = [IsAuthenticated]
    
  
  
   




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