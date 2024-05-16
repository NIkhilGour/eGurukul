class Category
{
      Category({required this.image,required this.title});

      final String image;
      final String title;
}

List<Category> getCategories()
{
        List<Category> categories = [];

       Category c1 =  Category(image: 'assets/images/business.jpeg', title: 'Business');
       categories.add(c1);
        Category c2 =  Category(image: 'assets/images/entertainment.jpeg', title: 'Entertainment');
        categories.add(c2);
         Category c3 = Category(image: 'assets/images/general.jpg', title: 'General');
         categories.add(c3);
          Category c4 = Category(image: 'assets/images/health.jpeg', title: 'Health');
          categories.add(c4);
           Category c5 = Category(image: 'assets/images/science.jpeg', title: 'Science');
           categories.add(c5);
            Category c6 = Category(image: 'assets/images/sports.jpeg', title: 'Sports');
            categories.add(c6);
             Category c7 = Category(image: 'assets/images/technology.jpeg', title: 'Technology');
             categories.add(c7);


             return categories;
}


