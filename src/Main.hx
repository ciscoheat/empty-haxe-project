
import dataclass.DataClass;
import haxecontracts.Contract;
import haxecontracts.HaxeContracts;
import haxedci.Context;
import js.Browser;

import mithril.M;

using Slambda;
using StringTools;

class Main 
implements HaxeContracts implements Mithril implements Context
{
	public function new() {
		Contract.requires(true != false, "Uh-oh.");

		this.amount = [100, 20, 3].fold.fn([i, n] => i + n, 0);

		this.user = new User({
			name: M.prop("Thorin Oakenshield")
		});		
	}
	
	///// Mithril stuff /////

	var user : User;

	public function view() [
		m("input", {
			oninput: M.withAttr("value", user.name),
			value: user.name()
		}),
		m(".user", { style: { margin: "15px" }}, user.name()),
		m("div", amount + " years old.")
	];
	
	static function main() {
		M.mount(Browser.document.body, new Main());
	}

	///// Test/DCI stuff /////
	
	public function start() amount.display();
	public function value() return amount;

	@role var amount : Int = {
		function display() : Void {
			trace(self);
		}
	}

	@invariant function invariants() {
		Contract.invariant(amount == 123, "Amount must always be 123.");
	}	
}

class User implements Model implements DataClass
{
	@prop public var name : String;
}
