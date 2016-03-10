
import haxecontracts.Contract;
import haxecontracts.HaxeContracts;
import js.npm.Express;
import js.npm.express.Request;
import js.npm.express.Response;

using Slambda;
using StringTools;

class Router implements HaxeContracts
{	
	public function new() {}
	
	public function createRoutes(app : Express) {
		
		app.get('/', function(req : Request, res : Response) {
			res.render("index");
		});

		app.get('/helloworld', function(req : Request, res : Response) {
			res.send("Hello World!");
		});
	}	
}
