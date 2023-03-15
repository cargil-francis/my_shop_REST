# Generated by Django 4.1.7 on 2023-03-14 18:19

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0002_alter_address_user_offer'),
    ]

    operations = [
        migrations.CreateModel(
            name='Discount',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('description', models.TextField()),
                ('percentage', models.IntegerField()),
            ],
        ),
        migrations.RemoveField(
            model_name='product',
            name='discount',
        ),
        migrations.AddField(
            model_name='offer',
            name='discount',
            field=models.ForeignKey(default=10, on_delete=django.db.models.deletion.CASCADE, to='shop.discount'),
            preserve_default=False,
        ),
    ]