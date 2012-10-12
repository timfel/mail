using System;
using System.Collections.Generic;
using Gtk;

namespace maillinux
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			Application.Init ();
			MainWindow win = new MainWindow ();
			
			System.Console.WriteLine (System.Runtime.InteropServices.Marshal.PtrToStringAuto (Etpan.curl_version ()));
			
			var oxws = new Etpan.Oxws ("tim.felgentreff@student.hpi.uni-potsdam.de", "hallo12");
			try {
				oxws.discover_settings ();
			} catch (Etpan.Error e) {
				System.Console.WriteLine (e.Message);
				oxws.set_settings("https://owa2.hpi.uni-potsdam.de/EWS/Exchange.asmx");
			}
			
			oxws.connect ();

			win.Show ();
			Application.Run ();
		}
	}
}
