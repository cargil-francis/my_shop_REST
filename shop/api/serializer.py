from ..models import User,Category,Product,Address


from rest_framework import serializers


class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        user = User.objects.create_user(validated_data['username'], validated_data['email'], validated_data['password'])

        return user  

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'


class ProductupdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ['title','short_description','product_image','price','discount']


class productdetailSerializer(serializers.ModelSerializer):
    class Meta:
        model =Product
        fields =['title','short_description','product_image','price','discount']


class ContactSerializer(serializers.ModelSerializer):
    class Meta:
        model =Address
        fields = '__all__'

class UserContactSerializer(serializers.ModelSerializer):
    address=ContactSerializer(source = 'user',many =True)
    class Meta:
        model =User
        fields = ['username','address']