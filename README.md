# my_shop_REST


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      </li>
	      <ul>
		       <li><a href="#built-with">Built With</a></li>
	     </ul>
	    <li>
	      <a href="#getting-started">Getting Started</a></li>
	      <ul>
	        <li><a href="#installation">Installation</a></li>
	        <li><a href="#prerequisites">Prerequisites</a></li>
</ul>
<li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
 
    
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

MY_Quiz_Application_Rest is a python project created using DjangoRestframework.
An Online Quiz Application with  Admin and Users. Various features are included in the project

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Built With

[Django]: https://docs.djangoproject.com/en/4.1/
[Django Restframework]: https://www.django-rest-framework.org/
![DjangoREST](https://img.shields.io/badge/DJANGO-REST-ff1709?style=for-the-badge&logo=django&logoColor=white&color=ff1709&labelColor=gray)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![SQLite](https://img.shields.io/badge/sqlite-%2307405e.svg?style=for-the-badge&logo=sqlite&logoColor=white)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started
### Installation


1. Clone the repo
   ```sh
   git clone https://github.com/cargil-francis/my_shop_REST.git
   ```
2. CD to project
   ```sh
   cd my_shop_REST
   ```


<p align="right">(<a href="#readme-top">back to top</a>)</p>



Follow the given steps to run the project in your localhost. 

### Prerequisites
* Install Python
  ```
  $ sudo apt install python3
  ```
* Create an environment
  ```
  $ python3 -m venv venv
  ```
  
* Activate environment
  ```
  $ source env/bin/activate
  ```

* Install dependencies
  ```
  $ (venv)  python -m pip install -r requirements.txt
  ```

* Make migrations
  ```
  $ (venv)  python3 manage.py makemigrations
  ```

* Migrate models
  ```
  $ (venv)  python3 manage.py migrate
  ```

* Run the project
  ```
  $ (venv)  python3 manage.py runserver
  ```




<!-- USAGE EXAMPLES -->
## Usage

Screenshots of the project using Postman
*User Registeration
![Screenshot from 2023-03-03 03-19-00](https://user-images.githubusercontent.com/96044398/222565868-763c8400-bc26-4942-bc30-77066fdf11fd.png)

*Login Using JWT Token

 ![Screenshot from 2023-03-23 12-25-38](https://user-images.githubusercontent.com/96044398/227267890-3da7c5b1-c749-40ac-9af6-559e37b8ce8b.png)

*Category list![Uploading Screenshot from 2023-03-23 12-25-38.png…]()

![Screenshot from 2023-03-23 20-46-32](https://user-images.githubusercontent.com/96044398/227259952-829166b5-1aeb-40e0-a3a9-1ec6d1c29415.png)

*Product list

![Screenshot from 2023-03-23 20-46-32](https://user-images.githubusercontent.com/96044398/227260592-9d20e4e3-4895-4e6d-ba63-2081ba69bb0c.png)

*UserContact View

![Screenshot from 2023-03-23 20-47-17](https://user-images.githubusercontent.com/96044398/227260311-22aa2e92-145c-4c50-afcc-edd14fecb877.png)


*Add to cart

![Screenshot from 2023-03-22 20-15-41](https://user-images.githubusercontent.com/96044398/227260954-edf54681-7113-44db-bbb0-97867e0d6662.png)

*Checkout

![Screenshot from 2023-03-22 20-15-25](https://user-images.githubusercontent.com/96044398/227261010-6b221623-b39c-4391-9380-34bdd50c01cb.png)

*Email Generation
![emailstatus](https://user-images.githubusercontent.com/96044398/227259734-1c40617d-0d52-4925-9b0f-8e0194f2e715.jpeg)


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap
- [x] Login page: Login API 1. Use JWT authorization
- [x] Home page(for all types of users): -API for showing product categories.
  - API for listing all products 1. functionalities: search, sorting with in price ranges, category filtering
	- API for listing products with offers and discounts
	- Product detail API
	- Add to cart API
	- checkout API (no need to setup payment gateway) 
		1. send mail to the current users mail after checkout
	- API for showing contact information
- [x] Admin page(for admin users):- Admin contact information add API
- [x] - API for adding and editing products 1. product details, price, pictures, discount rates,  etc.
- [x] - API for deleting products
- [x] Logout API

<p align="right">(<a href="#readme-top">back to top</a>)</p>
