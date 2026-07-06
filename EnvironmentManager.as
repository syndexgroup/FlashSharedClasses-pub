package com.syndex.sharedpublic {
	import flash.system.Capabilities;
	import com.syndex.sharedpublic.enums.EnvironmentOS;
	
	public class EnvironmentManager {
        private static var _currentOS:String = "";
        private static var _isRuffle:Boolean = false;
        private static var _isInitialized:Boolean = false;
		
		/**
		 * Initialize the environment data
		*/		
        public static function init():void {
            if (_isInitialized) {
				return;
			}
            
            // detect if ruffle
            var version:String = Capabilities.version.toLowerCase();
            _isRuffle = (version.indexOf("ruffle") != -1);
            
            // detect os
            var osStr:String = Capabilities.os.toLowerCase();
            
            if (osStr.indexOf("win") != -1) {
                _currentOS = EnvironmentOS.WINDOWS;
            } 
			else if (osStr.indexOf("mac") != -1) {
                _currentOS = EnvironmentOS.MACOS;
            } 
			else if (osStr.indexOf("linux") != -1 || osStr.indexOf("unix") != -1) {
                _currentOS = EnvironmentOS.LINUX;
            } 
			else if (osStr.indexOf("android") != -1) {
                _currentOS = EnvironmentOS.ANDROID;
            } 
			else if (osStr.indexOf("iphone") != -1 || osStr.indexOf("ipad") != -1) {
                _currentOS = EnvironmentOS.IOS;
            } 
			else {
                _currentOS = EnvironmentOS.UNKNOWN;
            }
            
            _isInitialized = true;
        }

		/**
		 * Return the detected OS 
		 * @return 
		*/		
        public static function get os():String {
            if (!_isInitialized) {
				init();
			}
			
            return _currentOS;
        }

		/**
		 * Check if running inside the Ruffle runtime 
		 * @return 
		 */        
        public static function get isRuffle():Boolean {
            if (!_isInitialized) {
				init();
			}
			
            return _isRuffle;
        }
        
		/**
		 * Check if running under Windows 
		 * @return 
		 */        
        public static function get isWindows():Boolean {
            return os === EnvironmentOS.WINDOWS;
        }

		/**
		 * Check if running under Linux 
		 * @return 
		 * 
		 */        
        public static function get isLinux():Boolean {
            return os === EnvironmentOS.LINUX;
        }
        
		/**
		 * Debug output 
		 * @return 
		 * 
		 */		
        public static function getDebugInfo():String {
            return "OS: " + Capabilities.os + ", player ver: " + Capabilities.version;
        }
    }
}
