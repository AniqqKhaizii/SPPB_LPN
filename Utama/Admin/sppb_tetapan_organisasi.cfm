<cfinclude template="../includes/head.cfm">


<body>
           <div class="flex h-screen overflow-auto bg-white">

            <!-- Sidebar Menu -->
            <cfinclude template="../includes/sppb_site_menu.cfm">

            <!-- Main Content Wrapper -->
            <div class="relative flex flex-col lg:ml-64 w-full min-h-screen">

                <!-- Header -->
                <cfinclude template="../includes/header.cfm">

                <!-- Main Content -->
                <main class="bg-transparent pt-12 flex-grow">
                    <cfinclude template="./sppb_tetapan_organisasi_i.cfm">
                </main>
            </div>
    </div>
</body>