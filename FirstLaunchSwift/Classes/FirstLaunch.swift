import Foundation

open class FirstLaunch {
    
    open class func isFirstLaunch()->Bool{
        let storeValue = UserDefaults.standard.string(forKey: self._storeKey())
        let shortVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        return storeValue==shortVersion ? false:true
    }
    
    open class func saveFirstLaunch()->Bool{
        let shortVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
        UserDefaults.standard.set(shortVersion, forKey: self._storeKey())
        return UserDefaults.standard.synchronize()
    }
    
    private static func _storeKey()->String{
        let bundleIdentifier =  Bundle.main.bundleIdentifier
        let className = NSStringFromClass(self)
        return "\(bundleIdentifier ?? "")_\(className)_FirstLaunchKey"
    }
}
