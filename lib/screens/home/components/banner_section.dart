import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "A MELHOR ESCOLHA PARA SUAS COMPRAS",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: ColorsTheme.pinkColor,
                    fontSize: width * 0.012,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto'),
              ),
              Text(
                "Variedade de produtos de alta qualidade",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.w700,
                    color: ColorsTheme.textColor),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 0.020 * width, bottom: 0.020 * width),
                child: Text(
                  "Na nossa loja online, você encontrará uma ampla seleção de itens que atendem a todas as suas necessidades. Não perca a oportunidade de fazer suas compras com rapidez, comodidade e, claro, com garantia de qualidade.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: width * 0.018,
                      fontWeight: FontWeight.w400,
                      color: ColorsTheme.grayColor),
                ),
              ),
              //BT Productos
              Center(
                child: SizedBox(
                  width: width * 0.22,
                  height: width * 0.037,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/products');
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: ColorsTheme.buttonColor),
                    child: Text(
                      'Veja Nossos Produtos',
                      style: TextStyle(
                        color: ColorsTheme.pinkColor,
                        fontWeight: FontWeight.w700,
                        fontSize: width * 0.013,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 8,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/coffeIMG.jpg',
                  scale: 1.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
