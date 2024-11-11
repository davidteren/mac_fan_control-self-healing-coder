import Foundation

class FanManager: ObservableObject {
    struct FanState {
        var isAuto: Bool
        var currentSpeed: Double
        var targetSpeed: Double
    }
    
    @Published var fans: [FanState] = []
    private let smc = SMC()
    private var timer: Timer?
    
    init() {
        // Initialize with two fans (typical MacBook configuration)
        fans = [
            FanState(isAuto: true, currentSpeed: 0, targetSpeed: 0),
            FanState(isAuto: true, currentSpeed: 0, targetSpeed: 0)
        ]
        
        // Start update timer
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateFanStates()
        }
    }
    
    private func updateFanStates() {
        // Update current speeds from SMC
        // This is a placeholder - actual SMC implementation needed
        for i in fans.indices {
            fans[i].currentSpeed = Double.random(in: 2000...6000) // Placeholder
        }
        
        objectWillChange.send()
    }
    
    func setFanAuto(fanIndex: Int, isAuto: Bool) {
        guard fanIndex < fans.count else { return }
        fans[fanIndex].isAuto = isAuto
        // Implement SMC control here
    }
    
    func setFanSpeed(fanIndex: Int, percentage: Double) {
        guard fanIndex < fans.count else { return }
        fans[fanIndex].targetSpeed = percentage
        // Implement SMC control here
    }
    
    deinit {
        timer?.invalidate()
    }
}
