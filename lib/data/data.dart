import 'package:max_bit/models/product.dart';
import 'package:max_bit/utils/constants.dart';

List<Product> getProducts() {
  List<Product> products = new List();
  Product product = new Product();
  //1
  product.id = 1;
  product.title = "Broccoli";
  product.price = 9.29;
  product.description = "";
  product.image = AvailableImages.broccoli["assetPath"];
  product.category = ProductCategories.vegetables;
  products.add(product);
  product = new Product();
  //2
  product.id = 2;
  product.title = "Onions";
  product.price = 3.56;
  product.description = "Fresh from the farm";
  product.image = AvailableImages.onions["assetPath"];
  product.category = ProductCategories.vegetables;
  products.add(product);
  product = new Product();
  //3
  product.id = 3;
  product.title = "Naga Gold Necklace";
  product.price = 20;
  product.description = "From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.";
  product.image = AvailableImages.nagaGoldNecklace["assetPath"];
  product.category = ProductCategories.jewelry;
  products.add(product);
  product = new Product();
  //4
  product.id = 4;
  product.title = "WD 2TB Hard Drive";
  product.price = 20;
  product.description = "USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system";
  product.image = AvailableImages.wdHardDrive["assetPath"];
  product.category = ProductCategories.electronics;
  products.add(product);
  product = new Product();
  //5
  product.id = 5;
  product.title = "Men's Casual T-Shirts";
  product.price = 25.99;
  product.description = "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.";
  product.image = AvailableImages.casualTShirt["assetPath"];
  product.category = ProductCategories.menClothing;
  products.add(product);
  product = new Product();
  //6
  product.id = 6;
  product.title = "Watermelon";
  product.price = 2.99;
  product.description = "Fresh harvested watermelon from Ada. Watermelon is a delicious and refreshing fruit that’s also good for you.  It contains only 46 calories per cup but is high in vitamin C, vitamin A and many healthy plant compounds. Here are the top 9 health benefits of eating watermelon";
  product.image = AvailableImages.watermelon["assetPath"];
  product.category = ProductCategories.fruits;
  products.add(product);
  product = new Product();
  //7
  product.id = 7;
  product.title = "White Gold Plated Ring";
  product.price = 9.99;
  product.description = "Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine's Day...";
  product.image = AvailableImages.goldPlatedRing["assetPath"];
  product.category = ProductCategories.jewelry;
  products.add(product);
  product = new Product();
  //8
  product.id = 8;
  product.title = "Opna Women's Short Sleeve";
  product.price = 35.99;
  product.description = "100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort";
  product.image = AvailableImages.opnaShortSleeve["assetPath"];
  product.category = ProductCategories.womenClothing;
  products.add(product);
  product = new Product();
  //9
  product.id = 9;
  product.title = "Acer SB220Q IPS Ultra-Thin";
  product.price = 1599;
  product.description = "21. 5 inches Full HD (1920 x 1080) widescreen IPS display And Radeon free Sync technology. No compatibility for VESA Mount Refresh Rate: 75Hz - Using HDMI port Zero-frame design | ultra-thin | 4ms response time | IPS panel Aspect ratio - 16: 9. Color Supported - 16. 7 million colors. Brightness - 250 nit Tilt angle -5 degree to 15 degree. Horizontal viewing angle-178 degree. Vertical viewing angle-178 degree 75 hertz";
  product.image = AvailableImages.acerUltraThin["assetPath"];
  product.category = ProductCategories.electronics;
  products.add(product);
  product = new Product();
  //10
  product.id = 10;
  product.title = "Mens Slim Fit";
  product.price = 15.99;
  product.description = "The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.";
  product.image = AvailableImages.menSlimFit["assetPath"];
  product.category = ProductCategories.menClothing;
  products.add(product);
  product = new Product();
  //11
  product.id = 11;
  product.title = "Mango";
  product.price = 2.99;
  product.description = "Fresh harvested watermelon from Ada. A mango is a stone fruit produced from numerous species of tropical trees belonging to the flowering plant genus Mangifera, cultivated mostly for their edible fruit. Most of these species are found in nature as wild mangoes";
  product.image = AvailableImages.mango["assetPath"];
  product.category = ProductCategories.fruits;
  products.add(product);
  product = new Product();
  //12
  product.id = 12;
  product.title = "Pineapple";
  product.price = 2.99;
  product.description = "Ananas comosus is an incredibly delicious and healthy tropical fruit. It originated in South America, where early European explorers named it after its resemblance to a pinecone (1). This popular fruit is packed with nutrients, antioxidants and other helpful compounds, such as enzymes that can fight inflammation and disease.";
  product.image = AvailableImages.pineapple["assetPath"];
  product.category = ProductCategories.fruits;
  products.add(product);
  product = new Product();
  //13
  product.id = 13;
  product.title = "Tomatoes";
  product.price = 2.99;
  product.description = "Fresh harvested watermelon from Ada";
  product.image = AvailableImages.tomatoes["assetPath"];
  product.category = ProductCategories.vegetables;
  products.add(product);
  product = new Product();
  //14
  product.id = 14;
  product.title = "Chili Pepper";
  product.price = 1.99;
  product.description = "Fresh harvested watermelon from Ada";
  product.image = AvailableImages.pepper["assetPath"];
  product.category = ProductCategories.vegetables;
  products.add(product);
  product = new Product();

  return products;
}
