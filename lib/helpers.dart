

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'google_adds/google_adds_services.dart';

bool get isMobile=>defaultTargetPlatform ==
    TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android;

Container get getBannerAddWidget=>
    isMobile ? Container(child:
AdWidget(ad: GoogleAddServices.getBannerAd()..load(), key: UniqueKey(),), height: 50)
        : Container(width: 0,height: 0,);

