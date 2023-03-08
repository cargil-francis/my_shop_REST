
from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from .views import  RegisterAPIView,AddCategoryAPIView,CategoryAPIView,AddProductAPIView,ProductAPIView,admincontactAPIView,contactAPIVIEW
from .views import  updateProductAPIView,ProductDeleteview

urlpatterns = [

    path('register/', RegisterAPIView.as_view(), name='register'),
    path('category/',AddCategoryAPIView.as_view(),name='category'),
    path('categorylist/',CategoryAPIView.as_view(),name ='viewcategory'),
    path('product/', AddProductAPIView.as_view(),name = 'Addproduct'),
    path('productlist/',ProductAPIView.as_view(), name = 'viewproducts'),

     path('contact/',admincontactAPIView.as_view(),name = 'admincontact'),
     path('contactview/',contactAPIVIEW.as_view(), name ='contactview'),
     path('productupdate/<int:id>',updateProductAPIView.as_view(), name ='productpatch'),
     path('productdelete/<int:id>',ProductDeleteview.as_view(),name ='deleteproduct'),
]
