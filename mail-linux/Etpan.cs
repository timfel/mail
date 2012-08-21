using System;
using System.Runtime.InteropServices;

namespace maillinux
{
	public class Etpan
	{
		enum Result {
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
		
		enum Distinguished_folder_id {
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
		
		struct CArray {
			System.IntPtr array;
			int len;
			int max;
		}
		
		[DllImport("etpan")]
		protected static extern int oxws_new();
		[DllImport("etpan")]
		protected static extern Result oxws_set_connection_settings(System.IntPtr oxws, System.IntPtr setting);
		[DllImport("etpan")]
		protected static extern Result oxws_autodiscover_connection_settings(System.IntPtr oxws, string host, string mail, string user, string pw, string domain);
		[DllImport("etpan")]
		protected static extern Result oxws_connect(System.IntPtr oxws, string user, string pw, string domain);
		[DllImport("etpan")]
		protected static extern Result oxws_find_item(System.IntPtr oxws, Distinguished_folder_id dfolder_id, string folder_id, int count, [Out] Carray carrayptr);
	}
}
