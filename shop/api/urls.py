
from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from .views import  RegisterAPIView,AddCategoryAPIView,CategoryAPIView,AddProductAPIView,ProductAPIView,admincontactAPIView,contactAPIVIEW
from .views import  updateProductAPIView,ProductDeleteview,ProductDetailAPIView,UsercontactAPIView,ViewUsercontactAPIVIEW,OfferProductAPIVIEW,CreateofferAPIVIEW,CreatediscountAPIVIEW,AddToCartView

urlpatterns = [

    path('register/', RegisterAPIView.as_view(), name='register'),
    path('category/',AddCategoryAPIView.as_view(),name='category'),
    path('categorylist/',CategoryAPIView.as_view(),name ='viewcategory'),
    path('product/', AddProductAPIView.as_view(),name = 'Addproduct'),
    path('productlist/',ProductAPIView.as_view(), name = 'viewproducts'),
     #path('productdetails/<int:id>',ProductDetailAPIView.as_view(),name ='product detail'),
    path('usercontact/',UsercontactAPIView.as_view(), name ='createcontactuser'),
    path('usercontactview/',ViewUsercontactAPIVIEW.as_view(), name ='contactviewuser'),
    path('createproductoffer/',CreateofferAPIVIEW.as_view(),name ='createoffer'),
    path('offerproduct/',OfferProductAPIVIEW.as_view(), name ='offerproducts'),
    path('creatediscount/',CreatediscountAPIVIEW.as_view(),name ='discount'),
    path('addcart/',AddToCartView.as_view(),name = 'addtocart'),


    

    path('contact/',admincontactAPIView.as_view(),name = 'admincontact'),
    path('contactview/',contactAPIVIEW.as_view(), name ='contactview'),
    path('productupdate/<int:id>',updateProductAPIView.as_view(), name ='productpatch'),
    path('productdelete/<int:id>',ProductDeleteview.as_view(),name ='deleteproduct'),
]
