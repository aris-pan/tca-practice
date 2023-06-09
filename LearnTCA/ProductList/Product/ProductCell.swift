import SwiftUI
import ComposableArchitecture

struct ProductCell: View {
  let store: StoreOf<ProductFeature>
  
  var body: some View {
    WithViewStore(self.store) { viewStore in
      VStack {
        AsyncImage(
          url: viewStore.product.imageURL
        ) {
          $0
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 250)
        } placeholder: {
          ProgressView()
            .frame(width: 100, height: 250)
        }
        .padding(25)
        
        VStack(alignment: .leading) {
          Text(viewStore.product.title)
            .font(.custom("AmericanTypewriter", size: 20))
          HStack {
            Text("$\(viewStore.product.price.description)")
              .font(.custom("AmericanTypewriter", size: 25))
              .fontWeight(.bold)
            Spacer()
            AddToCartButton(
              store: self.store.scope(
                state: \.addToCartState,
                action: ProductFeature.Action.addToCart
              )
            )
          }
        }
      }
      .padding(20)
    }
  }
}

struct ProductCell_Previews: PreviewProvider {
  static var previews: some View {
    ProductCell(
      store: Store(
        initialState: ProductFeature.State(
          id: UUID(),
          product: Product.sample[0]
        ),
        reducer: ProductFeature()
      )
    )
    .border(.black)
  }
}
