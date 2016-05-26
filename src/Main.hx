
import haxecontracts.Contract;
import haxecontracts.HaxeContracts;

using Slambda;
using StringTools;

class Main 
implements Immutable implements HaxeContracts implements dci.Context
{	
	static function main() {
		// Clear out the rest of the file for a bare-bones starting point.
		trace(new Main("tseT").start());
	}

	public function new(name) {
		requires(true != false, "Uh-oh.");
		ensures(this.name != null);

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

	@invariant function inv() {
		invariant(amount == 123, "Amount must always be 123.");
	}
}
