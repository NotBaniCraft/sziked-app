import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KretaWebView extends StatefulWidget {
  final Function(String) onAuthComplete;
  
  const KretaWebView({super.key, required this.onAuthComplete});

  @override
  State<KretaWebView> createState() => _KretaWebViewState();
}

class _KretaWebViewState extends State<KretaWebView> {
  late WebViewController webController;
  int loadingProgress = 0;

  @override
  void initState() {
    super.initState();
    
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (request) {
          if (request.url.contains('mobil.e-kreta.hu') && request.url.contains('code=')) {
            // extract the auth code
            final uri = Uri.parse(request.url);
            final code = uri.queryParameters['code'];
            if (code != null) {
              widget.onAuthComplete(code);
              Navigator.pop(context);
            }
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onProgress: (progress) {
          setState(() {
            loadingProgress = progress;
          });
        },
      ))
      ..loadRequest(Uri.parse('https://idp.e-kreta.hu/Account/Login?ReturnUrl=%2Fconnect%2Fauthorize%2Fcallback%3Fprompt%3Dlogin%26nonce%3DwylCrqT4oN6PPgQn2yQB0euKei9nJeZ6_ffJ-VpSKZU%26response_type%3Dcode%26code_challenge_method%3DS256%26scope%3Dopenid%2520email%2520offline_access%2520kreta-ellenorzo-webapi.public%2520kreta-eugyintezes-webapi.public%2520kreta-fileservice-webapi.public%2520kreta-mobile-global-webapi.public%2520kreta-dkt-webapi.public%2520kreta-ier-webapi.public%26code_challenge%3DHByZRRnPGb-Ko_wTI7ibIba1HQ6lor0ws4bcgReuYSQ%26redirect_uri%3Dhttps%253A%252F%252Fmobil.e-kreta.hu%252Fellenorzo-student%252Fprod%252Foauthredirect%26client_id%3Dkreta-ellenorzo-student-mobile-ios%26state%3Dsziked-android-app%26suppressed_prompt%3Dlogin'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kréta Login'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: loadingProgress < 100
          ? Center(
              child: CircularProgressIndicator(
                value: loadingProgress / 100,
                color: Colors.green,
              ),
            )
          : WebViewWidget(controller: webController),
    );
  }
}
