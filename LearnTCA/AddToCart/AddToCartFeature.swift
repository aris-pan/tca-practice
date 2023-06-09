import Foundation
import ComposableArchitecture

struct AddToCartFeature: ReducerProtocol {
  struct State: Equatable {
    var counter = 0
  }
  
  enum Action: Equatable {
    case didTapPlusButton
    case didTapMinusButton
  }
  
  var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      switch action {
      case .didTapPlusButton:
        state.counter += 1
        return .none
      case .didTapMinusButton:
        state.counter -= 1
        return .none
      }
    }
  }
}
