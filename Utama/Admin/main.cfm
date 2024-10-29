<cfinclude template="../includes/head.cfm">

<body>
    <div class="flex h-screen overflow-auto bg-gradient-to-b from-indigo-50 to-indigo-100">
        <!-- Sidebar Menu -->
        <cfinclude template="../includes/sppb_site_menu.cfm">

        <!-- Main Content Wrapper -->
        <div class="relative flex flex-col lg:ml-64 w-full min-h-screen">

            <!-- Header -->
            <cfinclude template="../includes/header.cfm">

            <!-- Main Content -->
            <main class="bg-transparent px-5 pt-20 flex-grow">
                <cfinclude template="./main_i.cfm">
            </main>

            <!-- Footer -->
            <cfinclude template="../includes/footer.cfm">
        </div>
    </div>
</body>