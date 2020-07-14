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


}

