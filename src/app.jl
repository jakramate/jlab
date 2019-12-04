using Mux

@app test = (
  Mux.defaults,
  page(respond(index())),
  page("/about",
       probabilty(0.1, respond("<h1>Boo!</h1>")),
       respond("<h1>About Me</h1>")),
  page("/user/:user", req -> "<h1>Hello, $(req[:params][:user])!</h1>"),
  Mux.notfound())

fetch(serve(test,parse(Int,ARGS[1])))




function index()
    return "<html>
    <head>
        <style>
            header.page-header {
            width:80%;
            background-color:coral;
            text-align:center;
            }
        </style>
        <title>Welcome to Angkaew Data Lake service</title>
    </head>

    <body>
        <header class='page-header'>Angkaew Data Lake</header>
        <main>

        </main>

    </body>
</html>"
