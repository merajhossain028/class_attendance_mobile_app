// ignore_for_file: camel_case_types, must_be_immutable

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class reportt extends StatefulWidget {
  List list;
  String clas;
  reportt({Key? key, required this.list, required this.clas}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<reportt> createState() => _reporttState(list: list, clas: clas);
}

class _reporttState extends State<reportt> {
  List list;
  String clas;

  _reporttState({required this.list, required this.clas});
  final pdf = pw.Document();
  // ignore: prefer_typing_uninitialized_variables
  var marks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(''),
      // ),
      body: PdfPreview(
        canChangeOrientation: false,
        canDebug: false,
        build: (format) => generateDocument(
          format,
        ),
      ),
    );
  }

  Future<Uint8List> generateDocument(PdfPageFormat format) async {
    final doc = pw.Document(pageMode: PdfPageMode.outlines);

    final font1 = await PdfGoogleFonts.openSansRegular();
    final font2 = await PdfGoogleFonts.openSansBold();

    doc.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(
          pageFormat: format.copyWith(
            marginBottom: 0,
            marginLeft: 0,
            marginRight: 0,
            marginTop: 0,
          ),
          orientation: pw.PageOrientation.portrait,
          theme: pw.ThemeData.withFont(
            base: font1,
            bold: font2,
          ),
        ),
        build: (context) {
          return pw.Column(
            // mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.SizedBox(
                height: 20,
              ),
              pw.Text(
                'Attendance sheet',
                style: const pw.TextStyle(
                  fontSize: 25,
                ),
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: [
                  pw.Row(children: [
                    pw.Text(
                      'Date :',
                      style: const pw.TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    pw.Text(
                      DateTime.now().toString(),
                      style: const pw.TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ]),
                  pw.Row(
                    children: [
                      pw.Text(
                        'Class : ',
                        style: const pw.TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      pw.Text(
                        clas,
                        style: const pw.TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Table(
                defaultColumnWidth: const pw.FixedColumnWidth(120.0),
                border: pw.TableBorder.all(
                  style: pw.BorderStyle.solid,
                  width: 2,
                ),
                children: [
                  pw.TableRow(children: [
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Text(
                            'index',
                            style: const pw.TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ]),
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Text(
                            'Name',
                            style: const pw.TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ]),
                  ]),
                ],
              ),
              pw.ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) {
                  return pw.Table(
                    defaultColumnWidth: const pw.FixedColumnWidth(120.0),
                    border: pw.TableBorder.all(
                        // color: pw.Colors.black,
                        style: pw.BorderStyle.solid,
                        width: 2),
                    children: [
                      pw.TableRow(
                        children: [
                          pw.Column(children: [
                            pw.Text(
                              index.toString(),
                              textAlign: pw.TextAlign.center,
                              style: const pw.TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ]),
                          pw.Column(
                            children: [
                              pw.Text(
                                list[index],
                                textAlign: pw.TextAlign.center,
                                style: const pw.TextStyle(fontSize: 20.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );

    return doc.save();
  }
}