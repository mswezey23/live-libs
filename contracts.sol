contract ReuseRegistry {
    struct ReuseData {
        address a;
        string abi;
    }

    // TODO: Need to write an accessor for this, so we can list all libs
    bytes32[] public names;
    mapping (bytes32 => ReuseData) public data; 
    
    function register(bytes32 name, address a, string abi) {
        if (data[name].a == 0) {
            names.push(name);
            data[name] = ReuseData({ a: a, abi: abi});
        }
    }

    function get(bytes32 name) constant returns (address, string) {
        if (data[name].a == 0) return;
        ReuseData d = data[name];
        return (d.a, d.abi);
    }
}
