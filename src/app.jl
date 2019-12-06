function index()
    res = "asdf"
    return res
end


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
