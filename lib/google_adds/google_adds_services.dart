

import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAddServices{
static String get bannerUnit => Platform.isAndroid?'ca-app-pub-3568081759002686/3409092628':'ca-app-pub-3568081759002686/6454517156';
InterstitialAd? _interstitialAd;
int numOfAttemptLoad = 0;


static BannerAd getBannerAd() {
BannerAd bAd =  BannerAd(
size: AdSize.banner,
adUnitId:bannerUnit, //'ca-app-pub-3940256099942544/6300978111' :test one,
listener: BannerAdListener(onAdClosed: (Ad ad) {
print("Ad Closed");
}, onAdFailedToLoad: (Ad ad, LoadAdError error) {
ad.dispose();
}, onAdLoaded: (Ad ad) {
print('Ad Loaded');
}, onAdOpened: (Ad ad) {
print('Ad opened');
}),
request: AdRequest());

return bAd;
}

// create interstitial ads test one is :'ca-app-pub-3940256099942544/1033173712',
void createInterad() {
  InterstitialAd.load(
    adUnitId: Platform.isAndroid?'ca-app-pub-3568081759002686/1249192514':'ca-app-pub-3568081759002686/4323177838',
    request: AdRequest(),
    adLoadCallback:
    InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
      numOfAttemptLoad = 0;
    }, onAdFailedToLoad: (LoadAdError error) {
      numOfAttemptLoad++;
      _interstitialAd = null;

     if (numOfAttemptLoad <= 2) {
        createInterad();
      }
    }),
  );
}

// show interstitial ads to user
void showInterad() {
  if (_interstitialAd == null) {
    return;
  }

  _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
  onAdShowedFullScreenContent: (InterstitialAd ad) {
  print("ad onAdshowedFullscreen");
  }, onAdDismissedFullScreenContent: (InterstitialAd ad) {
  print("ad Disposed");
  ad.dispose();
  }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError aderror) {
  print('$ad OnAdFailed $aderror');
  ad.dispose();
  createInterad();
  });

  _interstitialAd!.show();

  _interstitialAd = null;
}
}