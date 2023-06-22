//
//  FilterDataProvider.swift
//  ContentBlocker
//
//  Created by Joshua C. Lerner on 6/20/23.
//

import NetworkExtension

class FilterDataProvider: NEFilterDataProvider {
    override func startFilter(completionHandler: @escaping (Error?) -> Void) {
        // Add code to initialize the filter.
        completionHandler(nil)
    }

    override func stopFilter(with reason: NEProviderStopReason, completionHandler: @escaping () -> Void) {
        // Add code to clean up filter resources.
        completionHandler()
    }

    override func handleNewFlow(_ flow: NEFilterFlow) -> NEFilterNewFlowVerdict {
        // Add code to determine if the flow should be dropped or not, downloading new rules if required.
        return .drop() // Restrict all traffic
    }

    override func handleInboundData(from flow: NEFilterFlow, readBytesStartOffset offset: Int, readBytes: Data) -> NEFilterDataVerdict {
        return .allow()
    }

    override func handleInboundDataComplete(for flow: NEFilterFlow) -> NEFilterDataVerdict {
        return .allow()
    }

    override func handleOutboundData(from flow: NEFilterFlow, readBytesStartOffset offset: Int, readBytes: Data) -> NEFilterDataVerdict {
        return .allow()
    }

    override func handleOutboundDataComplete(for flow: NEFilterFlow) -> NEFilterDataVerdict {
        return .allow()
    }

    override func handleRemediation(for flow: NEFilterFlow) -> NEFilterRemediationVerdict {
        return .allow()
    }

    override func handleRulesChanged() {}
}
