import 'package:cryptocurrency/features/dashboard/models/crypto_view_model.dart';
import 'package:cryptocurrency/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoDashboardScreen extends StatelessWidget {
  final CryptoListViewModel viewModel;
  final Function(CryptoViewModel) onTapItem;

  CryptoDashboardScreen({
    Key key,
    this.viewModel,
    this.onTapItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLUE_GREY,
      appBar: AppBar(
        title: Text("CRYPTOCURRENCY"),
      ),
      body: cryptoList(),
    );
  }

  Widget cryptoList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      color: BLUE_GREY,
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          viewModel.cryptoList.length == 0
              ? Container(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "CRYPTOCURRENCY CURRENTLY UNAVAILABLE",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: BASE_BLUE,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                      fontSize: 12,
                    ),
                  ),
                )
              :
              // : Container(
              //     padding: EdgeInsets.all(4.0),
              //     child: GridView.builder(
              //       padding: EdgeInsets.zero,
              //       shrinkWrap: true,
              //       itemCount: viewModel.cryptoList.length,
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 1,
              //           crossAxisSpacing: 2.0,
              //           mainAxisSpacing: 2.0),
              //       itemBuilder: (BuildContext context, int index) {
              //         return eachCryptoItemUI(
              //           viewModel.cryptoList[index],
              //         );
              //       },
              //     ),
              //   )

              ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.cryptoList == null
                      ? 0
                      : viewModel.cryptoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return eachCryptoItemUI(
                      viewModel.cryptoList[index],
                    );
                  },
                ),
        ],
      ),
    );
  }

  Widget eachCryptoItemUI(CryptoViewModel viewModel) {
    return InkWell(
      onTap: (){
        onTapItem(viewModel);
      },
      child: Card(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${viewModel.cryptoName}",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        color: BASE_BLUE,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${viewModel.cryptoSymbol}",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        color: BASE_BLUE,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                  icon: Icon(Icons.navigate_next_outlined), onPressed: null)
            ],
          ),
        ),
      ),
    );
  }
}
