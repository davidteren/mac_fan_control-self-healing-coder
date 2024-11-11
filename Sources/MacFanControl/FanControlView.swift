import SwiftUI

struct FanControlView: View {
    let fanIndex: Int
    @ObservedObject var fanManager: FanManager
    
    private var fan: FanManager.FanState {
        fanManager.fans[fanIndex]
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Fan \(fanIndex + 1)")
                .font(.headline)
            
            Toggle("Automatic", isOn: Binding(
                get: { fan.isAuto },
                set: { fanManager.setFanAuto(fanIndex: fanIndex, isAuto: $0) }
            ))
            .padding(.vertical, 5)
            
            if !fan.isAuto {
                Slider(
                    value: Binding(
                        get: { fan.targetSpeed },
                        set: { fanManager.setFanSpeed(fanIndex: fanIndex, percentage: $0) }
                    ),
                    in: 0...100
                ) {
                    Text("Speed")
                }
                Text("\(Int(fan.targetSpeed))%")
                    .font(.system(.body, design: .monospaced))
            }
            
            Text("Current: \(fan.currentSpeed) RPM")
                .font(.system(.caption, design: .monospaced))
            
            Divider()
        }
        .padding(.vertical, 5)
    }
}
