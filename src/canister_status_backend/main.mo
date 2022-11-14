import Principal "mo:base/Principal";
import IC "mo:management-canister";

actor Example {

  type CanisterStatus = {
    cycles : Nat;
    idle_cycles_burned_per_day : Nat;
    memory_size : Nat;
    module_hash : ?[Nat8];
    settings : {

      freezing_threshold : Nat;
      controllers : [Principal];
      memory_allocation : Nat;
      compute_allocation : Nat;

    };
    status : { #running; #stopped; #stopping };
  };

  public func status() : async CanisterStatus {
    let management : IC.Self = actor ("aaaaa-aa");
    await management.canister_status({
      canister_id = Principal.fromActor(Example);
    });
  };
};
