import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_icons/flutter_icons.dart';


void main() {runApp(MaterialApp(
	title: 'Pizzaria da Estalagem',
	 theme: ThemeData(
	   primarySwatch: Colors.yellow[800],
         ),
         home: Home(),
      )
    );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(223, 147, 20, 1.0),
        child: 
        Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('Este app refere-se ao cardapio da Pizzaria da Estalagem. Por enquanto não sera possivel efetuar compras, porem, mantenha o app atualizado, pois em breve você podera pedir suas pizzas por aqui!', style: TextStyle(color: Colors.white, fontSize: 40), textAlign: TextAlign.center,),
                  ),                  
                ]
              ),
            ),
            Container(
              color: Colors.black,
              height: 80,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.black), child: ListTile(title: Text('Continuar >', style: TextStyle(color: Colors.white, fontSize: 30), textAlign: TextAlign.center), onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},),),
                  ),
                ]
              ),
            )
          ],
        ),
      ),      
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Pizzaria da Estalagem'),
          ),
          actions: <Widget>[
            NavigationControls(_controller.future),
          ],
          backgroundColor: Color.fromRGBO(223, 147, 20, 1.0),
        ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://estalagemcasagrande.com.br/cardapio-app/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
         );         
        }
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),   
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(FontAwesome.globe),
                title: Text('SITE'),
                onTap: _launchURL5,
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text('RESERVE A POUSADA'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReservaPousada()));
                        },
              ),  
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(223, 147, 20, 1.0),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(Icons.home, color: Colors.white),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                          },
                        ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(FontAwesome.globe, color: Colors.white),
                          onPressed: _launchURL5
                        ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(Icons.exit_to_app, color: Colors.white),
                          onPressed: () {exit(0);},
                        ),
              ),
            )
          ],
        ),
    );
  }
}

class ReservaPousada extends StatefulWidget {
  @override
  _ReservaPousadaState createState() => _ReservaPousadaState();
}

class _ReservaPousadaState extends State<ReservaPousada> {
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Pizzaria da Estalagem'),
          ),
          actions: <Widget>[
            NavigationControls(_controller.future),
          ],
          backgroundColor: Color.fromRGBO(223, 147, 20, 1.0),
        ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://hbook.hsystem.com.br/Booking?companyId=5d002b6aab41d412ac7a00ef',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
         );         
        }
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),   
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(FontAwesome.globe),
                title: Text('SITE'),
                onTap: _launchURL5,
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text('RESERVE A POUSADA'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReservaPousada()));
                        },
              ), 
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(223, 147, 20, 1.0),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(Icons.home, color: Colors.white),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                          },
                        ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(FontAwesome.globe, color: Colors.white),
                          onPressed: _launchURL5
                        ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(Icons.exit_to_app, color: Colors.white),
                          onPressed: () {exit(0);},
                        ),
              ),
            )
          ],
        ),
    );
  }
}

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Pizzaria da Estalagem'),
          ),
          actions: <Widget>[
            NavigationControls(_controller.future),
          ],
          backgroundColor: Color.fromRGBO(223, 147, 20, 1.0),
        ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://estalagemcasagrande.com.br/sobre-app/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
         );
         
      }),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),   
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(FontAwesome.globe),
                title: Text('SITE'),
                onTap: _launchURL5,
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text('RESERVE A POUSADA'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReservaPousada()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(223, 147, 20, 1.0),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(Icons.home, color: Colors.white),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                          },
                        ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(FontAwesome.globe, color: Colors.white),
                          onPressed: _launchURL5
                        ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(Icons.exit_to_app, color: Colors.white),
                          onPressed: () {exit(0);},
                        ),
              ),
            )
          ],
        ),
    );
  }
}

class Contato extends StatefulWidget {
  @override
  _ContatoState createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Pizzaria da Estalagem'),
          ),
          actions: <Widget>[
            NavigationControls(_controller.future),
          ],
          backgroundColor: Color.fromRGBO(223, 147, 20, 1.0),
        ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://estalagemcasagrande.com.br/contato-app/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
         );
         
      }),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),   
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(FontAwesome.globe),
                title: Text('SITE'),
                onTap: _launchURL5,
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text('RESERVE A POUSADA'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReservaPousada()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(223, 147, 20, 1.0),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(Icons.home, color: Colors.white),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                          },
                        ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(FontAwesome.globe, color: Colors.white),
                          onPressed: _launchURL5
                        ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(Icons.exit_to_app, color: Colors.white),
                          onPressed: () {exit(0);},
                        ),
              ),
            )
          ],
        ),
    );
  }
}

class SobreOApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizzaria da Estalagem',
      theme: ThemeData.light(),
      home: Scaffold(
      appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Pizzaria da Estalagem'),
          ),
            backgroundColor: Color.fromRGBO(223, 147, 20, 1.0),
        ),
      body: 
        Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(68.0),
                child: Image.asset('imagens/logo-gup.png'),
              ),
              Text('Pizzaria da Estalagem'),
              Text('Criado pela Organize Websites!'),
              Text('Versão 1.0.1'),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image.asset('imagens/logo_p.png'),
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),   
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(FontAwesome.globe),
                title: Text('SITE'),
                onTap: _launchURL5,
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text('RESERVE A POUSADA'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReservaPousada()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(223, 147, 20, 1.0),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(Icons.home, color: Colors.white),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                          },
                        ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(FontAwesome.globe, color: Colors.white),
                          onPressed: _launchURL5
                        ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(Icons.exit_to_app, color: Colors.white),
                          onPressed: () {exit(0);},
                        ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PoliticaDePrivacidade extends StatefulWidget {
  @override
  _PoliticaDePrivacidadeState createState() => _PoliticaDePrivacidadeState();
}

class _PoliticaDePrivacidadeState extends State<PoliticaDePrivacidade> {
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Pizzaria da Estalagem'),
          ),
          actions: <Widget>[
            NavigationControls(_controller.future),
          ],
          backgroundColor: Color.fromRGBO(223, 147, 20, 1.0),
        ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://organizewebsites.com.br/privacidade-apps',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
         );
         
      }),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),   
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(FontAwesome.globe),
                title: Text('SITE'),
                onTap: _launchURL5,
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text('RESERVE A POUSADA'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReservaPousada()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(223, 147, 20, 1.0),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(Icons.home, color: Colors.white),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                          },
                        ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(FontAwesome.globe, color: Colors.white),
                          onPressed: _launchURL5
                        ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: IconButton(
                          icon: Icon(Icons.exit_to_app, color: Colors.white),
                          onPressed: () {exit(0);},
                        ),
              ),
            )
          ],
        ),
    );
  }
}

_launchURL() async {
  const url = 'http://wa.me/5512988782332&text=';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL3() async {
  const url = 'instagram://user?username=pizzariadaestalagem';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL4() async {
  const url = 'https://www.google.com/maps/place/Estalagem+Casa+Grande+Pousada/@-23.4919224,-45.0805701,17z/data=!3m1!4b1!4m8!3m7!1s0x94cd56a95c1d2c85:0x86d3753b87d3e915!5m2!4m1!1i2!8m2!3d-23.4919224!4d-45.0783814';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL5() async {
  const url = 'https://estalagemcasagrande.com.br';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoBack()) {
                        await controller.goBack();
                      } else {
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(content: Text("No back history item")),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoForward()) {
                        await controller.goForward();
                      } else {
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("No forward history item")),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: !webViewReady
                  ? null
                  : () {
                      controller.reload();
                    },
            ),
          ],
        );
      },
    );
  }
}