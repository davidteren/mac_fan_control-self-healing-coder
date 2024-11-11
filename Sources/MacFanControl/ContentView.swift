import SwiftUI

struct ContentView: View {
    @StateObject private var fanManager = FanManager()
    
    var body: some View {
        VStack {
            Text("Mac Fan Control")
                .font(.title)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(fanManager.fans.indices, id: \.self) { i in
                    FanControlView(fanIndex: i, fanManager: fanManager)
                }
            }
            .padding()
            
            Text("CPU Temperature: 45°C")
                .font(.system(.caption, design: .monospaced))
                .padding()
        }
        .frame(width: 300, height: 400)
    }
}
