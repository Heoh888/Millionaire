//
//  Observable.swift
//  Millionaire
//
//  Created by Алексей Ходаков on 08.06.2022.
//

import Foundation

public struct ObservableOptions: OptionSet, CustomStringConvertible {
    
    // MARK: - Public static properties
    public static let initial = ObservableOptions(rawValue: 1 << 0)
    public static let old = ObservableOptions(rawValue: 1 << 1)
    public static let new = ObservableOptions(rawValue: 1 << 2)
    
    // MARK: - Public properties
    public var rawValue: Int
    
    // MARK: - Initialization
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public var description: String {
        switch self {
        case .initial:
            return "initial"
        case .old:
            return "old"
        case .new:
            return "new"
        default:
            return "ObservableOptions(rawValue: \(rawValue))"
        }
    }
}

public class Observable<Type> {
    
    fileprivate class Callback {
        fileprivate weak var observer: AnyObject?
        fileprivate let options: [ObservableOptions]
        fileprivate let closure: (Type, ObservableOptions) -> Void
        
        fileprivate init(observer: AnyObject,
                         options: [ObservableOptions],
                         closure: @escaping (Type, ObservableOptions) -> Void) {
            self.observer = observer
            self.options = options
            self.closure = closure
        }
    }
    
    // MARK: - Properties
    public var value: Type {
        didSet {
            removeNilObserverCallbacks()
            notifyCallbacks(value: oldValue, option: .old)
            notifyCallbacks(value: value, option: .new)
        }
    }
    
    // MARK: - Object Lifecycle
    public init(_ value: Type) {
        self.value = value
    }
    
    // MARK: - Managing Observers
    private var callbacks: [Callback] = []
    
    public func addObserver(_ observer: AnyObject,
                            removeIfExists: Bool = true,
                            options: [ObservableOptions] = [.new],
                            closure: @escaping (Type, ObservableOptions) -> Void) {
        if removeIfExists {
            removeObserver(observer)
        }
        
        let callback = Callback(observer: observer,
                                options: options,
                                closure: closure)
        callbacks.append(callback)
        
        if options.contains(.initial) {
            closure(value, .initial)
        }
    }
    
    public func removeObserver(_ observer: AnyObject) {
        callbacks = callbacks.filter { $0.observer !== observer }
    }
    
    // MARK: - Private
    private func removeNilObserverCallbacks() {
        callbacks = callbacks.filter { $0.observer != nil }
    }
    
    private func notifyCallbacks(value: Type,
                                 option: ObservableOptions) {
        let callbacksToNotify = callbacks.filter {
            $0.options.contains(option)
        }
        callbacksToNotify.forEach { $0.closure(value, option) }
    }
}

class Observer { }

class TFManager: ObservableObject {
    
    // MARK: - Public properties
    public var maxLimitNum: Int
    
    // MARK: - Published properties
    @Published var maxLimit = true
    @Published var checkBox: Bool = false
    @Published var text = "" {
        didSet {
            if text.count > maxLimitNum && oldValue.count >= maxLimitNum {
                maxLimit = true
            } else {
                maxLimit = false
            }
            
        }
    }
    
    // MARK: - Initialization
    init (maxLimitNum: Int) {
        self.maxLimitNum = maxLimitNum
    }
}
