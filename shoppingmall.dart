import 'dart:io';

class Product {
  String name;
  int price;
  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products = [
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000),
  ];
  int totalPrice = 0;
  // 메뉴바
  void showMenu() {
    String line = ''.padRight(102, '*');
    print(line);
    print(
        '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
    print(line);
  }

  // 상품 목록 출력
  void showProducts() {
    print('[상품 목록 보기]를 선택하셨습니다.');
    for (var product in products) {
      print('${product.name}: ${product.price}원');
    }
    print('');
  }

  // 상품을 장바구니에 담기
  void addToCart(String choice) {
    bool found = false; // 상품 존재 여부 확인
    for (var product in products) {
      print(">> ${product.name} / $choice");
      if (product.name == choice) {
        totalPrice += product.price;
        print('${product.name}을 장바구니에 담았습니다.');
        found = true;
        break; // 상품을 찾았으므로 루프 종료
      }
    }
    if (!found) {
      print('해당 상품이 존재하지 않습니다.');
    }
  }

  // 장바구니에 담은 상품의 총 가격을 출력하는 메서드
  void showTotal() {
    print('장바구니에 담긴 총 가격: $totalPrice원\n');
  }
}

void main() {
  print('안녕하세요 ^^; MINJI SHOPPINGMALL 입니다.');
  var shoppingMall = ShoppingMall();
  bool isRunning = true;
  while (isRunning) {
    shoppingMall.showMenu();
    // 사용자 입력 받기
    var input = stdin.readLineSync();
    switch (input) {
      case '1':
        shoppingMall.showProducts();
        break;
      case '2':
        print('상품 이름을 입력해 주세요:');
        var choice = stdin.readLineSync();
        print(choice);
        if (choice != null) {
          shoppingMall.addToCart(choice);
        }
        break;
      case '3':
        shoppingMall.showTotal();
        break;
      case '4':
        print('프로그램 종료');
        isRunning = false;
        break;
      default:
        print('잘못 누르셨습니다');
    }
  }
}
