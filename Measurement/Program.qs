﻿namespace Measurement {
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Measurement;
    

    
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
        return M(qs[0]) == One ? 1 | 0;                                                                                                                                                                                                                 1                                                                                                       
    }

    operation BasisStates (qs : Qubit[]) : Int {
        // Measurement on the first qubit gives the higher bit of the answer, on the second - the lower
        let m1 = M(qs[0]) == Zero ? 0 | 1;
        let m2 = M(qs[1]) == Zero ? 0 | 1;
        return m1 * 2 + m2;
    }
    @EntryPoint()
    function FirstDifference(b1 : Bool[], b2 : Bool []) : Int {
        for(i in 0 .. Length(b1) - 1) {
            if (b1[i] != b2[i]) {
                return i;
            }
        }
        return -1;
    }
    
    function SuperDifference (b1: Bool[][], b2 : Bool[][], Nqubits : Int) : Int {
        for (i in 0 .. Nqubits - 1) {
            mutable val1 = 0;
            mutable val2 = 0;
            for (j in 0 .. Length(b1) - 1) {
                if (b1[j][i]){
                    set val1 += 1;
                }
            }
            for (k in 0 .. Length(b2) - 1) {
                if (b2[k][i]) {
                    set val2 += 1;
                }
            }
            if ((val1 == Length(b1) and val2 == 0) or (val1 == 0 and val2 == Length(b2)))) {
                return i;
            }
        }
        return -1;
    }
    operation AllZeroOrW (qs : Qubit[]) : Int {
        return ResultArrayAsInt(MultiM(qs)) == 0 ? 0 | 1;
    }
}

