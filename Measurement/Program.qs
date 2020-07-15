namespace Measurement {
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    

    
    operation IsQubitOne() : Bool {
        using(q = Qubit()){
         return M(q) == One;  
        }
    }
    @EntryPoint()
    operation InitializeQubit() : Unit {
        using(q = Qubit()){
            if(M(q) == One) {
                X(q);
            }
        }
    }

    operation isQubitPlus() : Bool {
        using(q = Qubit()){
            H(q);
            return M(q) == Zero;
        }
    }
    
    operation isQubitMinus() : Bool {
        using(q = Qubit()){
            return Measure([PauliX], [q]) == One;
        }
    }

    operation isQubitA (alpha : Double, q : Qubit) : Bool {
        Ry(-2.0 * alpha, q);
        return M(q) == Zero;
    }

    operation ZeroOrOne (qs : Qubit[]) : Int {
        return M(qs[0]) == One ? 1 | 0;
    }
}

