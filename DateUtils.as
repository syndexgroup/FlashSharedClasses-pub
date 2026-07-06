package com.syndex.sharedpublic {
	public class DateUtils {
		public static function getISOString(date:Date):String {
			var pad:Function = function(num:int):String {
				return (num < 10) ? "0" + num : num.toString();
			};
			
			var padMs:Function = function(num:int):String {
				if (num < 10) {
					return "00" + num;
				}
				
				if (num < 100) {
					return "0" + num;
				}
				
				return num.toString();
			};
			
			return date.fullYearUTC + "-" +
				pad(date.monthUTC + 1) + "-" +
				pad(date.dateUTC) + "T" +
				pad(date.hoursUTC) + ":" +
				pad(date.minutesUTC) + ":" +
				pad(date.secondsUTC) + "." +
				padMs(date.millisecondsUTC) + "Z";
		}
	}
}