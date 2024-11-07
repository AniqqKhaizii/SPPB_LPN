<cfcomponent>
  <cfset this.name = "SPPB">
  <cfset this.sessionmanagement = "Yes">
  <cfset this.sessionTimeout = #CreateTimeSpan(1,0,0,0)#>  
  <cfset this.datasource = "LPN_0SYS">
  <cfset root_dir = "C:\ColdFusion2018\cfusion\wwwroot\SPPB_LPN">	

  <cffunction name="onRequestStart" access="public" returntype="void">
        <cfargument name="target" type="string" required="true">

        <cfset var newURL = arguments.target>
        <cfset var newExt = ".cfm">

        <cfif not findNoCase(newExt, newURL)>
            <cfset newURL = newURL & newExt>
        </cfif>

        <cfset request.target = newURL>
    </cffunction>

    <cffunction name="onMissingTemplate">
        <cfargument name="targetPage" type="string" required=true/>

        <cftry>
            <cfoutput>
            <cfinclude template="./Utama/includes/head.cfm">
            <body>
                    <div class="flex h-screen overflow-clip bg-gradient-to-b from-gray-50 to-gray-100">
                        <!-- Sidebar Menu -->
                        <cfinclude template="./Utama/includes/sppb_site_menu.cfm">
                        <!-- Main Content Wrapper -->
                        <div class="relative flex flex-col lg:ml-64 w-full min-h-screen">
                            <!-- Header -->
                            <cfinclude template="./Utama/includes/header.cfm">
                            <!-- Main Content -->
                            <main class="bg-transparent pt-12 flex-grow">
                                <div class="relative z-0 m-8 mb-72 grid place-content-center bg-gradient-to-b from-[##1e0542] via-purple-800 to-[##71094f] h-[90vh] shadow-xl">
                                        <div class="absolute h-[90vh] w-full shadow-xl"></div>
                                        <div class="z-10 flex flex-col justify-start items-center text-center w-full">
                                            <img src="../../public/assets/Maintenance.png" class="-mt-32"/>
                                            <!--- <h1 class="text-9xl font-black text-gray-200">404</h1>

                                            <p class="text-2xl font-bold tracking-tight text-gray-900 sm:text-4xl">Uh-oh!</p>

                                            <p class="mt-4 text-gray-500">We can't find that page.</p> --->

                                            <a
                                            href="./main.cfm"
                                            class="-mt-36 w-48 mx-auto inline-block rounded bg-transparent border border-indigo-200 px-5 py-3 text-lg font-medium text-white shadow-xl hover:bg-indigo-700 focus:outline-none focus:ring"
                                            >
                                            Laman Utama
                                            </a>
                                        </div>
                                </div>
                            </main>
                        </div>
                </div>
            </body>
            </cfoutput>
            <cfreturn true />
            
        <cfcatch>
            <cfreturn false />
        </cfcatch>
        </cftry>
    </cffunction>
</cfcomponent>
