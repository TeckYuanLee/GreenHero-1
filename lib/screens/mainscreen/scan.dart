import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController _controller;
  Barcode _barcode;
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller.pauseCamera();
    }
    _controller.resumeCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Scan & Earn'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            buildQrView(context),
            Positioned(
              child: buildResult(),
              bottom: 3.h,
            ),
            Positioned(
              child: buildControlButtons(),
              top: 3.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildControlButtons() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: FutureBuilder(
              future: _controller?.getFlashStatus(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Icon(snapshot.data ? Icons.flash_on : Icons.flash_off);
                } else {
                  return Container();
                }
              },
            ),
            onPressed: () async {
              await _controller?.toggleFlash();
              setState(() {});
            },
          ),
          IconButton(
            icon: FutureBuilder(
              future: _controller?.getCameraInfo(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Icon(Icons.switch_camera);
                } else {
                  return Container();
                }
              },
            ),
            onPressed: () async {
              await _controller?.flipCamera();
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget buildResult() {
    return Container(
      padding: EdgeInsets.all(1.5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), color: Colors.white),
      child: Text(_barcode != null
          ? 'Result: ${_barcode.code}'
          : 'Scan a code to earn points!'),
    );
  }

  Widget buildQrView(BuildContext context) {
    void _onQRViewCreated(QRViewController controller) {
      setState(() {
        this._controller = controller;
      });
      _controller.scannedDataStream.listen((barcode) {
        setState(() {
          this._barcode = barcode;
        });
      });
    }

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderLength: 20,
        borderRadius: 10,
        borderColor: Theme.of(context).accentColor,
        borderWidth: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }
}
