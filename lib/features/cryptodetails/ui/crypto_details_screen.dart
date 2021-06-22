import 'package:cryptocurrency/features/cryptodetails/models/crypto_details_view_model.dart';
import 'package:cryptocurrency/utils/helper_functions.dart';
import 'package:cryptocurrency/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoDetailsScreen extends StatelessWidget {
  final CryptoDetailsViewModel viewModel;

  CryptoDetailsScreen({
    Key key,
    this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLUE_GREY,
      appBar: AppBar(
        title: Text("${viewModel.cryptoName}".toUpperCase()),
        centerTitle: true,
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
          viewModel == null
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
              : eachCryptoItemUI()
        ],
      ),
    );
  }

  Widget eachCryptoItemUI() {
    return Card(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                    "${viewModel.logo}",
                  ),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  width: 16,
                ),
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
                          fontWeight: FontWeight.bold,
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
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                viewModel.pdfInfo.isEmpty
                    ? IgnorePointer()
                    : IconButton(
                        icon: Icon(Icons.picture_as_pdf_outlined),
                        onPressed: () => launchURL(viewModel.pdfInfo),
                      )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            viewModel.officialWebsite.isEmpty
                ? IgnorePointer()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Official Website :",
                        style: GoogleFonts.poppins(
                          color: BASE_BLUE,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        onTap: () => launchURL(viewModel.officialWebsite),
                        child: Text(
                          viewModel.officialWebsite,
                          style: GoogleFonts.poppins(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Description : ',
              style: GoogleFonts.poppins(
                color: BASE_BLUE,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                fontSize: 14,
              ),
            ),
            Text(
              viewModel.description,
              style: GoogleFonts.poppins(
                color: BASE_BLUE,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
