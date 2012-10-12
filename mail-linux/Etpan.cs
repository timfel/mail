using System;
using System.Runtime.InteropServices;

namespace maillinux
{
	public class Etpan
	{
		[DllImport("mail")]
		static extern System.IntPtr mail_new (mail_type type);
		[DllImport("mail")]
		static extern void mail_free (System.IntPtr account);

		[DllImport("mail")]
		static extern bool mail_discover_settings (System.IntPtr account, string host, string mail, string user, string pw);
		[DllImport("mail")]
		static extern bool mail_discover_settings (System.IntPtr account, string host, string mail, string user, string pw, string domain);
		[DllImport("mail")]
		static extern bool mail_set_settings (System.IntPtr account, string as_url, string oof_url, string um_url, string oab_url);
		[DllImport("mail")]
		static extern bool mail_connect (System.IntPtr account, string user, string pw, string domain);

		[DllImport("mail")]
		static extern string mail_get_error_str ();

		enum mail_type
		{
			POP3,
			IMAP,
			SMTP,
			OXWS
		}

		public class Error: System.Exception
		{
			public Error (string msg) : base (msg)
			{
			}
		};

		public class Oxws
		{
			public string email_address { get; set; }

			string _username;

			public string username {
				get {
					if (this._username == null) {
						this._username = email_address.Split ('@') [0];
					}
					return this._username;
				}
				set { this._username = value; }
			}

			public string password { get; set; }

			public string host { get; set; }

			public string domain { get; set; }

			System.IntPtr oxws;

			public Oxws (string email_address, string password)
			{
				this.email_address = email_address;
				this.password = password;
				this.oxws = mail_new (mail_type.OXWS);
			}

			~Oxws()
			{
				mail_free(this.oxws);
			}

			public void connect ()
			{
				if (!mail_connect (oxws, username, password, domain)) {
					throw new Error (mail_get_error_str ());
				}
			}

			public void discover_settings ()
			{
				if (!mail_discover_settings (oxws, host, email_address, username, password, domain)) {
					throw new Error (mail_get_error_str ());
				}
			}

			public void set_settings(string as_url, string oof_url = null, string um_url = null, string oab_url = null)
			{
				if (!mail_set_settings (oxws, as_url, oof_url, um_url, oab_url)) {
					throw new Error (mail_get_error_str ());
				}
			}
		}

		[DllImport("curl")]
		public static extern System.IntPtr curl_version ();
	}
}
