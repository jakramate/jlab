function index()
    res = " <html>   <head>
        <style>
            header.page-header {
            width:100%;
	    height:100px;
            background-color:coral;
            text-align:center;
            }
            footer.page-footer {
            width:100%;
            background-color:coral;
            text-align:center;
            }
	    table {
	width:100%
}
	    td.thumbnail{
		width:30%;
		border-left:1px solid coral;
		border-top:1px solid coral;
		border-bottom:1px solid coral;
		text-align:center;
		}
	    td.description{
		width:70%;
		border-right:1px solid coral;
		border-top:1px solid coral;
		border-bottom:1px solid coral;
		}
	    img {
		width:200px;
		}
        </style>
        <title>Welcome to Angkaew Data Lake service</title>
    </head>

    <body>
        <header class='page-header'>Angkaew Data Lake</header>
        <main>
	<table>"

	# now looping thru items in our database
    for i=1:5
        res *= "<tr><td class='thumbnail'><img src='data.jpg' alt='data'></td><td class='description'><p>Description: asdfasfasdfadfdsfdfdf<br> Contributor: <br> Date:</p></td></tr>"
    end

    res *=  "</table></main>
	<footer class='page-footer'>Data science research center, Faculty of Science, Chiang Mai University</footer>
    </body>
    </html>"
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

serve(test)




