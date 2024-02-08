<script>
    import "../app.css";
</script>

<div class="flex flex-row">
    <div class="flex-1"></div>
    <div class="md:4/6 w-5/6 py-12 lg:w-3/6">
        <slot />
    </div>
    <div class="flex-1"></div>
</div>
