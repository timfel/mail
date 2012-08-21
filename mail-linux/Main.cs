using System;
using Gtk;

namespace maillinux
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			Application.Init ();
			MainWindow win = new MainWindow ();
			
			var oxws = Etpan.oxws_new();
			var result = Etpan.oxws_autodiscover_connection_settings(oxws,
			                                                         "owa2.hpi.uni-potsdam.de",
			                                                         args[0] + "@student.hpi.uni-potsdam.de",
			                                                         args[0],
			                                                         args[1],
			                                                         "HPI");
			if (result == Etpan.Result.autodiscover_unavailable) {
				var settings = new Etpan.OwxsConnectionSettings();
				settings.as_url = "https://owa2.hpi.uni-potsdam.de/EWS/Exchange.asmx";
				result = Etpan.oxws_set_connection_settings(oxws, ref settings);
			}
			if (result != Etpan.Result.no_error) {
				throw(new Exception(String.Format("Error: {0}", result.ToString().ToUpper())));
			}
			
			result = Etpan.oxws_connect(oxws, args[0], args[1], "HPI");
			if (result != Etpan.Result.no_error) {
				throw(new Exception(String.Format("Error: {0}", result.ToString().ToUpper())));
			}
			
			var itemsptrptr = new System.IntPtr();
			Etpan.oxws_find_item(oxws, Etpan.Distinguished_folder_id.inbox, null, 10, itemsptrptr);
			var itemsptr = System.Runtime.InteropServices.Marshal.ReadIntPtr(itemsptrptr);
			var items = (Etpan.CArray)System.Runtime.InteropServices.Marshal.PtrToStructure(itemsptr, typeof(Etpan.CArray));
			var items_array = items.array;

			win.Show ();
			Application.Run ();
		}
	}
}
