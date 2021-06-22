import 'package:cryptocurrency/utils/shimmer.dart';
import 'package:cryptocurrency/utils/themes.dart';
import 'package:flutter/material.dart';

class EventShimmerWidget extends StatelessWidget {
  const EventShimmerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: LIGHT_YELLOW_GREY,
        child: Center(
          child: Shimmer.fromColors(
            baseColor: GREY,
            highlightColor: WHITE30,
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: GREY_BASE,
                height: 2,
              ),
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 15,
              itemBuilder: (BuildContext ctx, int index) => Container(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ClipRRect(
                            child: Container(
                              height: 60,
                              width: 80,
                              color: GREY,
                            ),
                            // borderRadius: BorderRadius.circular(80),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 20,
                                  width: MediaQuery.of(context).size.width * 50,
                                  color: GREY,
                                ),
                                SizedBox(height: 5),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 20,
                                  width: MediaQuery.of(context).size.width * 40,
                                  color: GREY,
                                ),
                                SizedBox(height: 5),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 20,
                                  width: MediaQuery.of(context).size.width * 20,
                                  color: GREY,
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
