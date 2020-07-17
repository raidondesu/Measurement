namespace Measurement {
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    

    
    operation IsQubitOne() : Bool {
        using(q = Qubit()){
         return M(q) == One;  
        }
    }
    
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

    operation BasisStates (qs : Qubit[]) : Int {
        // Measurement on the first qubit gives the higher bit of the answer, on the second - the lower
        let m1 = M(qs[0]) == Zero ? 0 | 1;
        let m2 = M(qs[1]) == Zero ? 0 | 1;
        return m1 * 2 + m2;
    }
    @EntryPoint()
    operation FirstDifference(b1 : Bool[], b2 : Bool []) : Int {
        for(i in 0 .. Length(b1) - 1) {
            if (b1[i] != b2[i]) {
                return i;
            }
        }
        return -1;
    }
}

