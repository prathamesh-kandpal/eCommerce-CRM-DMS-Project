# Enterprise CRM for E-commerce

## Project Overview
This project focuses on developing an Enterprise Customer Relationship Management (CRM) system tailored for e-commerce businesses. The CRM is designed to centralize customer data, manage sales records, track customer interactions, and provide analytics on customer behavior, enhancing customer retention, improving support efficiency, and personalizing marketing efforts.

## Features
- **Customer Profile Management:** Organize and manage customer information including contact details, preferences, and transaction history.
- **Sales and Marketing Analytics:** Tools for segmenting customer data for targeted campaigns and analyzing sales data to tailor offers.
- **Customer Support and Tracking:** Manage and log support interactions to efficiently resolve issues and maintain quality service.
- **Loyalty Program Management:** Utilize customer data to identify loyal customers and offer targeted incentives.

## Technologies Used
- **Django**: For building the web application.
- **PostgreSQL**: As the backend database.
- **Django ORM**: For database interactions.
- **Python**: Primary programming language.
- **JavaScript/HTML/CSS**: For frontend development.
- **Azure**: Intended cloud platform for deployment (not implemented due to budget constraints).

## Installation
To set up the project locally, follow these steps:

1. **Clone the Repository**
git clone https://github.com/yourusername/project-repository.git 
cd project-repository

2. **Set Up a Virtual Environment** (Optional but recommended)
python -m venv venv source venv/bin/activate # On Windows use venv\Scripts\activate

3. **Install Dependencies**
pip install -r requirements.txt

4. **Database Setup**
- Make sure PostgreSQL is installed and running.
- Create a database named `ecommerce_data_lake`.
- Update the `DATABASES` configuration in `settings.py` with your database credentials.

5. **Run Migrations**
- python manage.py makemigrations 
- python manage.py migrate

6. **Start the Development Server**
- python manage.py runserver

7. **Visit the Application**
- Open a browser and go to `http://localhost:8000` to start using the application.

## Screenshots

Below are screenshots from the CRM system, showcasing the intuitive user interface and key functionalities:

### Login Page

![Login](screenshots/landing_page.png)

### Dashboard
This view displays an overview of key performance metrics and insights.
![Dashboard](screenshots/dashboard.png)

### Customer Table
View and manage customer information effectively.
![Customer Table](screenshots/customers.png)

### Orders Table
Track and analyze customer orders with ease.
![Orders Table](screenshots/orders.png)

### Products Table
Manage product inventory and details.
![Products Table](screenshots/products.png)

## License
Distributed under the MIT License. See `LICENSE` for more information.

## Contact
- **Prathamesh Kandpal** - [plk7197@nyu.edu](mailto:plk7197@nyu.edu)
- Project Link: [https://github.com/prathamesh-kandpal/eCommerce-CRM-DMS-Project](https://github.com/prathamesh-kandpal/eCommerce-CRM-DMS-Project)

## Acknowledgements
- [Django Documentation](https://docs.djangoproject.com/en/3.1/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Under the guidance of Prof. Jean Claude Franchitti - NYU Courant]
