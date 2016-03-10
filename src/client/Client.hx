import haxecontracts.Contract;
import haxecontracts.HaxeContracts;
import haxedci.Context;
import js.Browser;

import mithril.M;

using Slambda;
using StringTools;

class Client
implements HaxeContracts implements Mithril implements Context
{
	static function main() {
		M.mount(Browser.document.getElementById("content"), new Client());
	}
	
	////////////////////////////////////////////////////////

	var user : User;

	public function new() {
		Contract.requires(true != false, "Uh-oh.");

		this.user = new User({
			name: "Thorin Oakenshield",
			birthYear: 1146
		});
	}
	
	public function view() [
		INPUT({
			oninput: M.withAttr("value", function(value) user.name = value),
			value: user.name
		}),
		DIV.user({style: {paddingTop: "20px"}}, [
			DIV("Name: ", STRONG(user.name)),
			DIV("Age: ", STRONG(Date.now().getFullYear() - user.birthYear + " years old"))
		])
	];
	
	@invariant function invariants() {
		Contract.invariant(user.name.startsWith("Thorin") , "The user is not a Dwarven king.");
	}	
}
