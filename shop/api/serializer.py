from ..models import User,Category,Product,Address,Offer,Discount,Cart, Order
from django.shortcuts import get_object_or_404
from django.core.mail import send_mail

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
    category_title = serializers.ReadOnlyField(source = 'category.title')
    class Meta:
        model = Product
        fields = ['title','sku','short_description','product_image','price','category_title']



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

class DiscountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discount
        fields = '__all__'

class DiscountIDSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discount
        fields = ['id']


class ProductIDSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ['id']

# class ProductOfferSerializer(serializers.ModelSerializer):
#     product = ProductIDSerializer(read_only=True)
#     discount = DiscountIDSerializer(read_only=True)
#     class Meta:
#         model = Offer
#         fields = '__all__'

#         def create(self,validated_data):
#             product_data = validated_data.pop('product')
#             discount_data = validated_data.pop('discount')

#             product = Product.objects.get(id=product_data['id'])
#             discount = Discount.objects.get(id=discount_data['id'])


#             offer = Offer.objects.create(product=product,discount=discount,**validated_data)
#             return offer
            
class OfferSerializer(serializers.ModelSerializer):
    product_id = serializers.IntegerField(write_only=True)
    discount_id = serializers.IntegerField(write_only=True)

    class Meta:
        model = Offer
        fields = ['id', 'product_id', 'discount_id', 'start_date', 'end_date']

    def create(self, validated_data):
        product_id = validated_data.pop('product_id')
        discount_id = validated_data.pop('discount_id')

        try:
            product = Product.objects.get(id=product_id)
        except Product.DoesNotExist:
            raise serializers.ValidationError("Product with provided ID does not exist")

        try:
            discount = Discount.objects.get(id=discount_id)
        except Discount.DoesNotExist:
            raise serializers.ValidationError("Discount with provided ID does not exist")

        offer = Offer.objects.create(product=product, discount=discount, **validated_data)

        return offer




class CartSerializer(serializers.ModelSerializer):
    product_id = serializers.IntegerField() 
    
    class Meta:
        model = Cart
        fields = ['product_id', 'quantity']

    def create(self, validated_data):
        product_id = validated_data['product_id']
        print(product_id)
        user = self.context['request'].user
        print(user)
        # product = Product.objects.get(id=product_id)
        prd = Product.objects.get(id = product_id)
        print("prd object ivde" ,prd)

        product = get_object_or_404(Product, id=product_id)
        print("product object ivde" ,product)
    
        quantity = validated_data['quantity']
        print(quantity)

        cart,created= Cart.objects.get_or_create(user=user, product=prd)
        print(cart,created)
        if not created:
            cart.quantity += quantity
            cart.save()
        return cart




# class CheckoutSerializer(serializers.Serializer):
#     # fields for checkout
    
#     def create(self, validated_data):
#         # perform checkout process
#         user = self.context['request'].user
#         send_mail(
#             'Checkout Confirmation',
#             'Thank you for your purchase!',
#             'your_email@example.com',
#             [user.email],
#             html_message='<p>Thank you for your purchase!</p>'
#         )
#         return validated_data



# class OrderItemSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = OrderItem
#         fields = ['product', 'quantity']


# class OrderSerializer(serializers.ModelSerializer):
#     items = OrderItemSerializer(many=True, read_only=True)

#     class Meta:
#         model = Order
#         fields = ['id', 'user', 'items', 'total', 'created_at']
#         read_only_fields = ['id', 'user', 'total', 'created_at']


class AddressSerializer(serializers.ModelSerializer):
    class Meta:
        model = Address
        fields = ('id', 'locality', 'city', 'state', 'phone')



class OrderSerializer(serializers.ModelSerializer):
    items = CartSerializer(many=True, read_only=True)

    class Meta:
        model = Order
        fields = ('id', 'product', 'user', 'address', 'quantity', 'status', 'items', 'ordered_date')
