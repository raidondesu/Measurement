namespace Measurement {
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    

    @EntryPoint()
    operation IsQubitOne() : Bool {
        using(q = Qubit()){
         return M(q) == One;   
        }
    }
}

