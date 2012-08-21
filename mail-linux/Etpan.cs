using System;
using System.Runtime.InteropServices;

namespace maillinux
{
	public class Etpan
	{		
		public enum Result {
			no_error,
			invalid_parameter,
			bad_state,
			internal_error,
			connect,
			no_ews,
			autodiscover_unavailable,
			request_failed,
			invalid_response
		};
		
		public enum Distinguished_folder_id {
			_none,
			_min,
			calendar,
			contacts,
			deleteditems,
			drafts,
			inbox,
			journal,
			notes,
			outbox,
			sentitems,
			tasks,
			msgfolderroot,
			root,
			junkemail,
			searchfolders,
			voicemail,
			_max,
			_count
		};
		
		public struct CArray {
			[MarshalAs (UnmanagedType.ByValArray)]
			public int[] array;
			public int len;
			public int max;
		}
		
		public struct OwxsConnectionSettings {
			public string as_url;
			public string oof_url;
			public string um_url;
			public string oab_url;
		}
		
		[DllImport("etpan")]
		public static extern System.IntPtr oxws_new();
		[DllImport("etpan")]
		public static extern Result oxws_set_connection_settings(System.IntPtr oxws, ref OwxsConnectionSettings setting);
		[DllImport("etpan")]
		public static extern Result oxws_autodiscover_connection_settings(System.IntPtr oxws, string host, string mail, string user, string pw, string domain);
		[DllImport("etpan")]
		public static extern Result oxws_connect(System.IntPtr oxws, string user, string pw, string domain);
		[DllImport("etpan")]
		public static extern Result oxws_find_item(System.IntPtr oxws, Distinguished_folder_id dfolder_id, string folder_id, int count, [Out] System.IntPtr carrayptr);
	}
}
