
import haxecontracts.Contract;
import haxecontracts.HaxeContracts;

using Slambda;
using StringTools;

class Main 
implements HaxeContracts implements dci.Context
{	
	static function main() {
		new Main("Main").start();
	}

	public function new(name) {
		Contract.requires(true != false, "Uh-oh.");
		Contract.ensures(this.name != null);

		this.name = name;
		this.amount = [100, 20, 3].fold.fn([i, n] => i + n, 0);
	}
	
	public function start() {
		return name.reversed() + amount;
	}
	
	@role var name : {
		function toString() : String;
	} = {
		function reversed() : String {
			var o = self.toString().split("");
			o.reverse();
			return o.join("");
		}
	}
	
	var amount : Int;

	@invariant function invariants() {
		Contract.invariant(amount == 123, "Amount must always be 123.");
	}
}
